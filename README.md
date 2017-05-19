# OnlineFoodCourt

2017.5.18 门一凡
log:
* 添加了bean文件夹下的customer+dish+order+orderitem
* 添加了JDNI访问

问题：bean.order里的时间 是java.util 还是 java.sql类型？？

2017.5.19 门一凡
log：
* 对数据库中Customer的userid添加unique属性 （同步更新了crebas.sql文件）
* 添加DAOFactory.java文件
* 完成了ICustomerDAO的设计 和 CustomerDAOMySqlImpl的实现 （未测试）

问题：
customer表中的userid代表什么？和username有什么区别？
JNDI只能用于Servlet和JSP页面，那么对数据库操作还是用.java还是全写到jsp里？ 单元测试怎么办？ (CustomerDAOMySqlImplTest无法测试的原因)