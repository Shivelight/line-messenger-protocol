# LINE Messenger Thrift IDL

This Thrift IDL based on reverse-engineered official LINE software; accuracy not guaranteed.

## Contributing
You can contribute by adding or updating definition (enum, struct, exception, service, method/function). You also required to write documentation string with following format:

```
/**
 * [<explanation of what this definition does>]
 *
 * [First Seen: <date in ISO 8601> (<source>)]
 * [Last Seen: <date in ISO 8601> (<source>)]
 * Updated: <date in ISO 8601> (<source>)
 */
struct LineStruct {

	/** [This field does something unambiguos] */
	1: string ambiguousField
	2: bool enabled
}
```

If you don't understand what a definition does, you can leave it empty.  You can also document parameter or field if you find it vague or unclear. The updated date is the only thing mandatory.

More docstring examples: https://github.com/apache/thrift/blob/master/test/DocTest.thrift
