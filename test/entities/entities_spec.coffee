chai = require 'chai'
expect = chai.expect


Program = require '#{__dirname}/../../entities/program.coffee'
Block = require '#{__dirname}/../../entities/block.coffee'
Type = require '#{__dirname}/../../entities/type.coffee'

ForStatement = require '#{__dirname}/../../entities/forstatement.coffee'
StdFor = require '#{__dirname}/../../entities/stdfor.coffee'
StdForIdExp = require '#{__dirname}/../../entities/stdforidexp.coffee'
CountFor = require '#{__dirname}/../../entities/countfor.coffee'
CountsFor = require '#{__dirname}/../../entities/countsfor.coffee'
IfStatement = require '#{__dirname}/../../entities/ifstatement.coffee'
ElseIfStatement = require '#{__dirname}/../../entities/elseifstatement.coffee'
ElseStatement = require '#{__dirname}/../../entities/elsestatement.coffee'

# MatchStatement = require '#{__dirname}/../../entities/matchstatement.coffee'
#     this file doesn't exist yet
# PatBlock = require '#{__dirname}/../../entities/patblock.coffee'
# PatLine = require '#{__dirname}/../../entities/patline.coffee'
# Patterns = require '#{__dirname}/../../entities/patterns.coffee'
# Pattern = require '#{__dirname}/../../entities/pattern.coffee'

WhileStatement = require '#{__dirname}/../../entities/whilestatement.coffee'
ReturnStatement = require '#{__dirname}/../../entities/returnstatement.coffee'
ClassDefinition = require '#{__dirname}/../../entities/classdefinition.coffee'

VariableDeclaration = require '#{__dirname}/../../entities/variabledeclaration.coffee'
VariableAssignment = require '#{__dirname}/../../entities/variableassignment.coffee'
VariableExpression = require '#{__dirname}/../../entities/variableexpression.coffee'
Args = require '#{__dirname}/../../entities/args.coffee'
ExpList = require '#{__dirname}/../../entities/explist.coffee'

FunctionExp = require '#{__dirname}/../../entities/functionexp.coffee'
Params = require '#{__dirname}/../../entities/params.coffee'
ParamList = require '#{__dirname}/../../entities/paramlist.coffee'

TrailingIf = require '#{__dirname}/../../entities/trailingif.coffee'
VariableReference = require '#{__dirname}/../../entities/variablereference.coffee'
FieldAccess = require '#{__dirname}/../../entities/fieldaccess.coffee'
IterableItem = require '#{__dirname}/../../entities/iterableitem.coffee'
Range = require '#{__dirname}/../../entities/range.coffee'
IntegerLiteral = require '#{__dirname}/../../entities/integerliteral.coffee'
FloatLiteral = require '#{__dirname}/../../entities/floatliteral.coffee'
BooleanLiteral = require '#{__dirname}/../../entities/booleanliteral.coffee'
StringLiteral = require '#{__dirname}/../../entities/stringliteral.coffee'

List = require '#{__dirname}/../../entities/list.coffee'
Dict = require '#{__dirname}/../../entities/dict.coffee'
BindingList = require '#{__dirname}/../../entities/bindinglist.coffee'
Binding = require '#{__dirname}/../../entities/binding.coffee'
# Function = require '#{__dirname}/../../entities/function.coffee'
# i have no idea how this differs from FunctionExp

BinaryExpression = require '#{__dirname}/../../entities/binaryexpression.coffee'
UnaryExpression = require '#{__dirname}/../../entities/unaryexpression.coffee'


describe 'Entities', ->

  describe 'Program Entity', ->
    context 'when contructing a program', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new Program 'body').toString()).to.eql('(Program body)')
        done()

  describe 'Block Entity', ->
    context 'when contructing a block', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new Block ['Stmt', 'Stmt']).toString()).to.eql('(Block Stmt Stmt)')
        done()

  describe 'Type Entity', ->
    context 'when constructing a type', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((Type.BOOL).toString()).to.eql('bool')
        done()

  describe 'VariableDeclaration Entity', ->
    context 'when constructing a variable declaration', ->
      it 'constructs and toStrings correctly', (done) ->
        token = {
          kind: 'id',
          lexeme: 'foo',
          line: 3,
          col: 1
        }
        expect((new VariableDeclaration token, 'bool', 3).toString())
          .to.eql('(VarDec \'foo\' of type:bool = 3)')
        done()

  describe "Args Entity" , ->
    context 'when constructing an args', ->
      it 'constructs and Args correctly', (done) ->
        expect((new Args 'expList').toString()).to.eql('(expList)')
        done()

  describe 'StdFor Entity', ->
    context 'when constructing a standard for', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new StdFor 'foo', 'int', 'dict', 'bar').toString())
          .to.eql('(StdFor foo:int in dict, bar)')
        done()

  # Maybe we don't need StdForIdExp
  # describe 'StdForIdExp', -> #this is not correct. entity declaration is not finished
  #   context 'when constructing a standard for id expression', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect(new StdForIdExp ['(foo in bar)'], 'Body').toString()
  #       .to.eql('(StdForIdExp idexplist:(foo in bar) body:Body)')
  #       done()

  describe 'CountFor Entity', ->
    context 'when constructing a count for', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new CountFor 2).toString()).to.eql('(CountFor count 2)')
        done()

  # describe 'CountsFor Entity', ->
  #   context 'when constructing a counts for', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new CountsFor foo 2).toString()).to.eql('(CountsFor foo count 2)')
  #       #need to define foo
  #       done()

  describe 'IfStatement Entity', ->
    context 'when constructing an if statement', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new IfStatement ['foo in bar'], 'Body').toString())
          .to.eql('(If foo in bar then Body)')
        #incomplete, needs to account for if, elseif, else statements
        done()

  # describe 'WhileStatement Entity', ->
  #   context 'when constructing a while statement', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new WhileStatement foo in bar , 'Body' ).toString())
  #          .to.eql('(While foo in bar then Body)')
  #     needs some work
  #     done()

  describe 'ReturnStatement Entity', ->
    context 'when constructing a return statement of a string', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new ReturnStatement 'hello').toString()).to.eql('(Return hello)')
        done()
    
    context 'when constructing a return statement of an int', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new ReturnStatement 5).toString()).to.eql('(Return 5)')
        done()

    context 'when constructing a return statement of a boolean', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new ReturnStatement true).toString()).to.eql('(Return true)')
        done()

  describe 'IntegerLiteral Entity', ->
    context 'when constructing an integer literal', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new IntegerLiteral {lexeme:5}).toString()).to.eql(5)
        done()
    context 'when constructing an integer literal (0)', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new IntegerLiteral {lexeme:0}).toString()).to.eql(0)
        done()
    context 'when constructing a negative integer literal', ->
      it 'constructs and toStrings correctly', (done) ->
        expect((new IntegerLiteral {lexeme:-10}).toString()).to.eql(-10)
        done()

  # describe 'FloatLiteral Entity', ->
  #   context 'when constructing a float literal', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new FloatLiteral 2.5).toString()).to.eql(2.5)
  #       #not done...value.lexeme is the result of the toString.....
  #         #(not sure where to put that)
  #       done()
  
  describe 'BooleanLiteral Entity', ->
    context 'when constructing a boolean literal', ->
      it 'constructs and toStrings correctly (true)', (done) ->
        hiho = true
        expect((new BooleanLiteral hiho).toString()).to.eql('true')
        done()
    context 'when constructing a boolean literal (false)', ->
      it 'constructs and toStrings correctly', (done) ->
        biho = false
        expect((new BooleanLiteral biho).toString()).to.eql('false')
        done()

  describe 'StringLiteral Entity', ->
    context 'when constructing a string literal', ->
      it 'constructs and toStrings correctly', (done) ->
        token = {
          lexeme: 'hello'
        }
        expect((new StringLiteral token).toString()).to.eql('hello')
        done()
    context 'when constructing a string literal longer than one word', ->
      it 'constructs and toStrings correctly', (done) ->
        string = {
          lexeme: 'hello my name is sally'
        }
        expect((new StringLiteral string).toString()).to.eql('hello my name is sally')
        done()

  # describe 'List Entity', ->
  #   context 'when constructing a list', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new List ).toString()).to.eql('[]')
  #       done()

  # describe 'Dict Entity', ->
  #   context 'when constructing a dictionary', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new Dict).toString()).to.eql(#what goes here??)
  #       done()

  describe 'BindingList Entity', ->
    context 'when constructing a binding list', ->
      it 'constructs and toStrings correctly', (done) ->
        token = ['face'; 'nose'; 'mouth']
        expect((new BindingList token).toString()).to.eql('face, nose, mouth')
        done()

  # needs: proper type... tried @INT, int, IntegerLiteral, intlit....
  # describe 'Binding Entity', ->
  #   context 'when constructing a binding', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new Binding 'hi', intlit, 5).toString())
  #           .to.eql('Binding hi intlit to 5')
  #       done()

  # needs: operator to have a .lexeme, so token?
  # describe 'BinaryExpression Entity', ->
  #   context 'when constructing a binary expression', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new BinaryExpression == 5 5).toString()).to.eql('(BinaryOp == 5 6)')

  #same as above: needs proper definition of the operator
  # describe 'UnaryExpression Entity', ->
  #   context 'when constructing a unary expression', ->
  #     it 'constructs and toStrings correctly', (done) ->
  #       expect((new UnaryExpression '-', 5).toString()).to.eql('(UnaryOp - 5)')
  #       done()