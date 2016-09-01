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
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb add "Learn Ruby"
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb ready 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb progress 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb complete 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
1. 2016-09-01 01:55:52 +0000 -> Learn Ruby -> 2016-09-01 01:57:02 +0000
```

Go backwards...

```
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb -complete 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb -progress 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb -ready 1
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
1. Learn Ruby
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 2
Ready
-----
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 3
In Progress
-----------
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 4
Complete
--------
```

Add more items...

```
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb add "Watch TV"
vagrant@rubyvm:/vagrant/todo-class$ ./todo.rb list 1
Backlog
-------
1. Learn Ruby
2. Watch TV
```
