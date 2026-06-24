"""
TODO:

foo should accept an argument that's either a string or an integer.
"""


def foo(x: str | int) -> None:
    ...


foo("foo")
foo(1)

foo([])  # expect-type-error
