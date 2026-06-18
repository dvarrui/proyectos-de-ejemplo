#!/usr/bin/env python3
# https://refactoring.guru/design-patterns/decorator/python/example

class Component():
    def operation(self) -> str:
        pass


class ConcreteComponent(Component):
    def operation(self) -> str:
        return "ConcreteComponent"


class Decorator(Component):
    _component: Component = None

    def __init__(self, component: Component) -> None:
        self._component = component

    @property
    def component(self) -> Component:
        return self._component

    def operation(self) -> str:
        return self._component.operation()


class ConcreteDecoratorA(Decorator):
    def operation(self) -> str:
        return f"ConcreteDecoratorA({self.component.operation()})"


class ConcreteDecoratorB(Decorator):
    def operation(self) -> str:
        return f"ConcreteDecoratorB({self.component.operation()})"


if __name__ == "__main__":
    simple = ConcreteComponent()
    print("Client: I've got a simple component:")
    print(f"RESULT: {simple.operation()}", end="")
    print("\n")


    decorator1 = ConcreteDecoratorA(simple)
    decorator2 = ConcreteDecoratorB(decorator1)
    print("Client: Now I've got a decorated component:")
    print(f"RESULT: {decorator2.operation()}", end="")
