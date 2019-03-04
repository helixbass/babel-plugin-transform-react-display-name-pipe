babel = require '@babel/core'
plugin = require '../index'

plugins = [plugin, '@babel/plugin-syntax-jsx']

it 'works on flow()', ->
  {code} = babel.transform(
    """
    const Comp = flow(
      something => great,
      ({name}) => <div>{name}</div>
    )
  """
    {plugins}
  )
  expect(code).toMatchSnapshot()

it 'works on pipe()', ->
  {code} = babel.transform(
    """
      const Comp = pipe()
    """
    {plugins}
  )
  expect(code).toMatchSnapshot()

it 'works on flowMax()', ->
  {code} = babel.transform(
    """
    const Comp = flowMax(
      something => great,
      ({name}) => <div>{name}</div>
    )
  """
    {plugins}
  )
  expect(code).toMatchSnapshot()
