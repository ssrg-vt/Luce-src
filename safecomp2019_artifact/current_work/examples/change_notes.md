# Parser
The assembly parser in its current state does not like section headers of the
form

		.section .comment
		.align 32
		.globl
		.type , @other
	:

As that section is ultimately ignored in our current work, substituting
something like

		.section .comment
		.align 32
		.globl xxxxxxxxxxxxxxxxx
		.type xxxxxxxxxxxxxxxxx, @other
	xxxxxxxxxxxxxxxxx:

works just fine. The same applies to empty `.quad` entries, which get generated
sometimes; in places where they are not actually used, those can be supplied
with arbitrary argument values. We also sometimes get `.long` entries, which
must then be changed to two `.quad`s on 64-bit Linux systems as the parser
doesn't handle `.long`s right now.

# Additional HermitCore changes
`LOG_ERROR` and `LOG_DEBUG` defines, as well as the functions in `dummy.{h,c}`,
are dummied out.

Thread-local storage using `per_core` and related constructs are not
supported. The main reason for lack of support is that our verification
methodology works best with position-independent executables and usage of the
assembly instructions internal to the `per_core` macro and related explicit
`.percore` section locating seems to require usage of the `-no-pie` option for
`gcc`. This is fine because we do not support concurrency right now anyway,
and thus those macros are modified to use non-thread-local storage.
