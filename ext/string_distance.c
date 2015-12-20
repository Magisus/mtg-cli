// Include the Ruby headers and goodies
#include "ruby.h"

// Defining a space for information and references about the module to be stored internally
VALUE StringDistance = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_string_distance();

// Prototype for our method 'test1' - methods are prefixed by 'method_' here
VALUE method_distance(VALUE self);

// The initialization method for this module
void Init_string_distance() {
	StringDistance = rb_define_module("StringDistance");
	rb_define_method(StringDistance, "distance", method_distance, 0);
}

// Our 'test1' method.. it simply returns a value of '10' for now.
VALUE method_distance(VALUE self) {
	int x = 10;
	return INT2NUM(x);
}
