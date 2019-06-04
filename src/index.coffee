###*
# This adds a .displayName to function components created using flow() or pipe() (from lodash/fp).
#
# Specifically, any declaration of a capitalized name initialized to a call to
# a function named `flow` or `pipe` gets followed by an assignment to its
# `.displayName` property.
###

export default ({types: t}) ->
  # Api

  visitor =
    VariableDeclarator: ({node: {id, init}, parentPath}) ->
      return unless id.type is 'Identifier' and /^[A-Z]/.test id.name
      return unless init.type is 'CallExpression'
      return unless (
        init.callee.type is 'Identifier' and
        init.callee.name in ['flow', 'pipe', 'flowMax']
      )
      parentPath.insertAfter(
        t.ifStatement(
          t.unaryExpression(
            '!'
            t.memberExpression t.identifier(id.name), t.identifier 'displayName'
          )
          t.expressionStatement(
            t.assignmentExpression(
              '='
              t.memberExpression(
                t.identifier id.name
                t.identifier 'displayName'
              )
              t.stringLiteral id.name
            )
          )
        )
      )
      null

  {
    name: 'transform-react-display-name-pipe'
    visitor
  }
