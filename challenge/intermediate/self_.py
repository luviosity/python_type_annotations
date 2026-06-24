"""
TODO:

`return_self` should return an instance of the same type as the current enclosed class.
"""

from typing import Self


class Foo:
    def return_self(self) -> Self:
        ...


class SubclassOfFoo(Foo):
    pass


f: Foo = Foo().return_self()
sf1: SubclassOfFoo = SubclassOfFoo().return_self()

sf2: SubclassOfFoo = Foo().return_self()  # expect-type-error
