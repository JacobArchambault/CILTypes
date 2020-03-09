.assembly extern mscorlib
{
	.publickeytoken = (b7 7a 5c 56 19 34 e0 89)
	.ver 4:0:0:0
}

// Our assembly.
.assembly CILTypes 
{
	.ver 1:0:0:0
}

// The module of our single-file assembly
.module CILTypes.dll

// Our assembly has a single namespace.
.namespace MyNamespace
{
	// An interface definition
	.class public interface IMyInterface {}
	
	.class public interface IMyOtherInterface
		implements MyNamespace.IMyInterface{}
				
	// System.Object base class assumed.
	.class public MyBaseClass 
	{
		// Some initialized fields
		.field private string stringField = "hello!"
		.field private int32 intField = int32(42)
		
		// A constructor
		.method public hidebysig specialname rtspecialname
			instance void .ctor(string s, int32 i) cil managed 
		{
			// TODO: Add implementation code...
		}
		
		// ***** Defining a property *****
		// Property Getter
		.method public hidebysig specialname
			instance string get_TheString() cil managed 
		{
			// TODO: Add implementation code...
		}
		
		// Property setter
		.method public hidebysig specialname
			instance void set_TheString(string 'value') cil managed
		{
			// TODO: Add implementation code...		
		}
		
		// The property.
		.property instance string TheString()
		{
			.get instance string
				MyNamespace.MyBaseClass::get_TheString()
			.set instance void 
				MyNamespace.MyBaseClass::set_TheString(string)
		}
		
		// A method.
		.method public hidebysig instance void
			Speak() cil managed
		{
			.maxstack 1
			ldstr "Hello there..."
			call void [mscorlib]System.Console::WriteLine(string)
			ret
		}
			
		.method public hidebysig static void 
			MyLocalVariables() cil managed
		{
			.maxstack 8
			// Define three local variables
			.locals init ([0] string myStr, [1] int32 myInt, [2] object myObj)
			// Load a string onto the virtual execution stack.
			ldstr "CIL Code is fun!"
			// Pop off current value and store in local variable [0].
			stloc.0
			
			// Load a constant of type "i4"
			// (shorthand for int32) set to the value 33.
			ldc.i4 33
			stloc.1
			
			// Create a new object and place on stack.
			newobj instance void [mscorlib]System.Object::.ctor()
			//Pop off current value and store in local variable [2].
			stloc.2
			ret
		}
	}
	
	// MyDerivedClass implements IMyInterface, 
	// and extends MyBaseClass.
	.class public MyDerivedClass 
		extends MyNamespace.MyBaseClass
		implements MyNamespace.IMyInterface {}
	
	// A structure definition is always sealed
	.class public sealed MyStruct
		extends [mscorlib]System.ValueType{}
		
	// Structure definition using shorthand notation
	.class public sealed value MyOtherStruct{}
	
	// Enum definition
	.class public sealed MyEnum 
		extends [mscorlib]System.Enum
	{
		.field public static literal valuetype
		MyNamespace.MyEnum A = int32(0)
		.field public static literal valuetype
		MyNamespace.MyEnum B = int32(1)
		.field public static literal valuetype
		MyNamespace.MyEnum C = int32(2)
	}

	// Enum definition with shorthand.
	.class public sealed enum MyOtherEnum{}
	
	// Defining a generic list with one type parameter
	//newobj instance void class [mscorlib]
	//	System.Collections.Generic.List`1<int32>::.ctor()

	// Defining a dictionary with two generic parameters.
	//newobj instance void class [mscorlib]
	//	System.Collections.Generic.Dictionary`2<string,int32>::.ctor()
		
	// Defining a List wtih another generic type as its parameter.
	//newobj instance void class [mscorlib]
	//	System.Collections.Generic.List`1<class
	//		[mscorlib]System.Collections.Generic.List`1<int32>>::.ctor()
}

