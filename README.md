# FMDB_CM
A demo for FMDB: How to use FMDatabase and FMDatabaseQueue

> 关于学习使用FMDB，除了笔者整理的官方文档翻译版，更重要的是实践和代码练习。笔者曾查阅过FMDB示例用法的一些文献，部分有的只讲到FMDatabase类，部分只讲专为多线程操作的FMDatabaseQueue类，很少有同时介绍两者用法区别的文章。这里，笔者做一个尝试。

- 这里提供我整理的[源码GigHub下载链接](https://github.com/cimain/FMDB_CM)， 觉得有需要的朋友可以直接下载Demo，而不用看本篇文章介绍。欢迎作出进一步优化与分享，笔者这个尝试也是得益于两个大神的文章。

- 关于FMDatabase，官方文档说：它表示一个单独的SQLite数据库，用来执行SQLite的命令。而关于FMDatabaseQueue，官方文档说：如果你想在多线程中执行多个查询或更新，你应该使用该类。这是线程安全的。

- 然而，你看完还是不知道FMDatabaseQueue是什么。在字面Queue意义上，它只是个队列？那还需要自己另外建一个DataBase吗？其实FMDatabaseQueue这个类的对象已经把一个数据库和有关事务操作的刚发封装在一起了。一个FMDatabaseQueue实例对象里面包含一个FMDatabase数据库对象。
