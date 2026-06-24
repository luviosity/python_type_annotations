"""
TODO:

foo should accept an empty tuple argument.
"""


def foo(x: tuple[()]) -> None:
    ...


foo(())
foo((1,))  # expect-type-error
