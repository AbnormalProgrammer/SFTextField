# SFTextField
自定义一个控件，解决一些UITextField原本的不足
## 它有什么用？
我发现UITextField不能直接修改placeholder的颜色，这个使用起来不方便，于是我写了它来设置placeholder的颜色。
## 怎么用？
为了不与UITextField中原本存在的placeholder混淆以引起歧义。<br>
这里增加了placeholderString来设置占位符文字。<br>
placeholderColor用来设置占位符的颜色。<br>
```
self.testTextField.placeholderString = "浪里个浪"
self.testTextField.placeholderColor = UIColor.systemRed
```
