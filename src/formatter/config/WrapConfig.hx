package formatter.config;

typedef WrapConfig = {
	/**
		maximum characters per line, formatter will try to wrap code longer than `maxLineLength`
	**/
	@:default(160) @:optional var maxLineLength:Int;

	/**
		should wrapping happen after comma
	**/
	@:default(true) @:optional var wrapAfterComma:Bool;

	/**
		should wrapping happen before dot
	**/
	@:default(true) @:optional var wrapBeforeDot:Bool;

	/**
		should wrapping happen after opening braces `(`
	**/
	@:default(true) @:optional var wrapAfterOpeningParenthesis:Bool;

	/**
		should wrapping happen after opening braces `{`
	**/
	@:default(true) @:optional var wrapAfterOpeningBrace:Bool;
	@:default(true) @:optional var wrapAfterPlus:Bool;

	/**
		should wrapping happen after opening brackets `[`
	**/
	@:default(true) @:optional var wrapAfterOpeningBracket:Bool;

	/**
		function signature wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [
			{
				conditions: [{cond: TotalItemLengthLessThan, value: 80}],
				type: NoWrap
			},
			{
				conditions: [{cond: ItemCountLargerThan, value: 10}],
				type: FillLine
			},
			{
				conditions: [{cond: AnyItemLengthLargerThan, value: 30}],
				type: OnePerLine
			},
			{
				conditions: [{cond: ItemCountLargerThan, value: 4}],
				type: OnePerLine
			}
		]
	})
	@:optional
	var arrayWrap:WrapRules;

	/**
		function signature wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [{
			conditions: [{cond: AnyItemLengthLargerThan, value: 50}],
			type: FillLine
		}]
	})
	@:optional
	var typeParameter:WrapRules;

	/**
		function signature wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [
			{
				conditions: [{cond: ItemCountLargerThan, value: 7}],
				type: FillLine,
				additionalIndent: 1
			},
			{
				conditions: [{cond: TotalItemLengthLargerThan, value: 100}],
				type: FillLine,
				additionalIndent: 1
			}
		]
	})
	@:optional
	var functionSignature:WrapRules;

	/**
		function signature wrapping rules
	**/
	@:default({
		defaultWrap: FillLine,
		rules: [
			{
				conditions: [{cond: ItemCountLargerThan, value: 7}],
				type: FillLine
			},
			{
				conditions: [{cond: TotalItemLengthLargerThan, value: 100}],
				type: OnePerLineAfterFirst
			},
			{
				conditions: [{cond: AnyItemLengthLargerThan, value: 60}],
				type: OnePerLineAfterFirst
			}
		]
	})
	@:optional
	var callParameter:WrapRules;

	/**
		object literal wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [
			{
				conditions: [{cond: ItemCountLessThan, value: 3}],
				type: NoWrap
			},
			{
				conditions: [{cond: AnyItemLengthLargerThan, value: 30}],
				type: OnePerLine
			},
			{
				conditions: [{cond: TotalItemLengthLargerThan, value: 60}],
				type: OnePerLine
			},
			{
				conditions: [{cond: ItemCountLargerThan, value: 4}],
				type: OnePerLine
			}
		]
	})
	@:optional
	var objectLiteral:WrapRules;

	/**
		anon types wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [
			{
				conditions: [{cond: ItemCountLessThan, value: 3}],
				type: NoWrap
			},
			{
				conditions: [{cond: AnyItemLengthLargerThan, value: 30}],
				type: OnePerLine
			},
			{
				conditions: [{cond: TotalItemLengthLargerThan, value: 60}],
				type: OnePerLine
			},
			{
				conditions: [{cond: ItemCountLargerThan, value: 4}],
				type: OnePerLine
			}
		]
	})
	@:optional
	var anonType:WrapRules;

	/**
		method chaining wrapping rules
	**/
	@:default({
		defaultWrap: NoWrap,
		rules: [
			{
				conditions: [{cond: ItemCountLessThan, value: 3}],
				type: NoWrap
			},
			{
				conditions: [{cond: TotalItemLengthLessThan, value: 80}],
				type: NoWrap
			},
			{
				conditions: [{cond: ItemCountLargerThan, value: 4}],
				type: OnePerLineAfterFirst
			}
		]
	})
	@:optional
	var methodChain:WrapRules;
}

typedef WrapRules = {
	@:default([]) @:optional var rules:Array<WrapRule>;
	@:default(NoWrap) @:optional var defaultWrap:WrappingType;
	@:default(0) @:optional var defaultAdditionalIndent:Int;
}

typedef WrapRule = {
	var conditions:Array<WrapCondition>;
	var type:WrappingType;
	@:default(0) @:optional var additionalIndent:Int;
}

@:enum
abstract WrappingType(String) {
	var OnePerLine = "onePerLine";
	var OnePerLineAfterFirst = "onePerLineAfterFirst";
	var EqualNumber = "equalNumber";
	var FillLine = "fillLine";
	var NoWrap = "noWrap";
	var Keep = "keep";
}

typedef WrapCondition = {
	var cond:WrapConditionType;
	@:default(1) @:optional var value:Int;
}

@:enum
abstract WrapConditionType(String) {
	var ItemCountLargerThan = "itemCount >= n";
	var ItemCountLessThan = "itemCount <= n";
	var AnyItemLengthLargerThan = "anyItemLength >= n";
	var AnyItemLengthLessThan = "anyItemLength <= n";
	var TotalItemLengthLargerThan = "totalItemLength >= n";
	var TotalItemLengthLessThan = "totalItemLength <= n";
	var LineLengthLargerThan = "lineLength >= n";
	var LineLengthLessThan = "lineLength <= n";
}

typedef ArrayWrapping = {
	@:default(30) @:optional var maxInlineAtLength:Int;
	@:default(30) @:optional var maxItemLength:Int;
	@:default(2) @:optional var maxOneLineItems:Int;
	@:default(60) @:optional var totalItemLengthOneLine:Int;
}
