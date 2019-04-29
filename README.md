# daily-coding-quxes-lisp

> On a mysterious island there are creatures known as Quxes which come in three colors: red, green, and blue.
> One power of the Qux is that if two of them are standing next to each other, they can transform into a single
> creature of the third color.

> Given N Quxes standing in a line, determine the smallest number of them remaining after any possible sequence of such transformations.
> For example, given the input ['R', 'G', 'B', 'G', 'B'], it is possible to end up with a single Qux.

### Test

    sbcl --non-interactive --eval "(ql:quickload :prove)" --eval "(prove:run #P\"quxes.lisp\")"