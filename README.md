###todo script

2nd attempt at Command line script to manage todos, this time using a class and methods
for todo items. Probably doing something horrible with class variables as this is just a 
learning experiment for me.

Backlog <-> ready <-> in progress <-> complete


```
./todos.rb add <todo item>
./todos.rb <move command> <list>

<move command>
list | ready | progress | complete | -ready | -progress | -complete
```

###Example run
```
$ ./todo.rb add "Learn Ruby"
$ ./todo.rb list 1
Backlog
-------
1. Learn Ruby
$ ./todo.rb list 2
Ready
-----
$ ./todo.rb list 3
In Progress
-----------
$ ./todo.rb list 4
Complete
--------
$ ./todo.rb ready 1
$ ./todo.rb list 1
Backlog
-------
$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
$ ./todo.rb progress 1
$ ./todo.rb list 3
In Progress
-----------
1. Learn Ruby
$ ./todo.rb complete 1
$ ./todo.rb list 4
Complete
--------
1. Learn Ruby
$ ./todo.rb -complete 1
$ ./todo.rb -progress 1
$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
$ ./todo.rb list 6
$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
$ ./todo.rb complete 1
$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
$ ./todo.rb list 3
In Progress
-----------
$ ./todo.rb list 4
Complete
--------
``
