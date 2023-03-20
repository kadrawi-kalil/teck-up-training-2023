// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[]public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
      //  todos.push(Todo(_text, false));

        // key value mapping
       // todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory myTodo;
        myTodo.text = _text;
        myTodo.completed =false;

        todos.push(myTodo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (Todo memory mytodo) {
        Todo storage myTodo = todos[_index];
        return myTodo;
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
