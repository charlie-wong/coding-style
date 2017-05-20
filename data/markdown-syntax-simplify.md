#       Mark down 语法简介
---
1. 空行表示另起一段<br>
2. 星号、加好、减号的效果一致<br>
3. 连续两个空格会变成一个\<br>，\<br>的意思在 HTML中表示换行<br>
4. \反斜线可用来转义<br>
5. 连续三个减号，会显示分割线<br>
6. Markdown的转义字符`\`用于以下在Markdown中有特殊含义的字符<br>
   \[\\]  ----  backslash<br>
   \[`]   ----  backtick<br>
   \[*]   ----  asterisk<br>
   \[_]   ---- underscore<br>
   \[{} ] ----  curly braces<br>
   \[[]]  ----  square brackets<br>
   \[()]  ----  parentheses<br>
   \[#]   ----  hash mark<br>
   \[+]   ----  plus sign<br>
   \[-]   ----   minus sign (hyphen)<br>
   \[.]   ----   dot<br>
   \[!]   ----  exclamation mark<br>


# Markdown 中使用 html 标记表示空格
beg [<html>&ensp;&ensp;&ensp;&ensp;&ensp;]</html>  end<br>
beg [&emsp;&emsp;&emsp;&emsp;&emsp;]               end<br>
1. 每个实体代表 1 个空格<br>
1. en是字体排印学的计量单位, 为em宽度的一半<br>
2. `&nbsp;`&nbsp;&nbsp;No-Break Space&nbsp;&nbsp;按下space键产生的空格, 空格占据宽度受字体影响强烈<br>
3. `&ensp;`&nbsp;&nbsp;En Space&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;空格占据宽度基本上不受字体影响, 名义上是小写字母 n 的宽度<br>
4. `&emsp;`&nbsp;&nbsp;Em Space&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;空格占据宽度基本上不受字体影响, 名义上是一个中文字符的宽度<br>
5. `&thinsp;`&nbsp;&nbsp;Thin Space<br>
6. `&zwnj;`&nbsp;&nbsp;Zero Width Non Joiner<br>
7. `&zwj;`&nbsp;&nbsp;Zero Width Joiner<br>

---
#       标题
#       this is an header leval 1 tag<br>
##      this is an header level 2 tag<br>
###     this is an header level 3 tag<br>
####    this is an header level 4 tag<br>
#####   this is an header level 5 tag<br>
######  this is an header level 6 tag (just only 6 header level in mark-down)<br>
---
#       字体<br>
*斜体*<br>
_斜体_<br>
**黑体**<br>
__黑体__<br>
~~删除线~~
---
#       列表
* item num 1<br>
* item num 2<br>
  * item num 2-1<br>
  * item num 2-2<br>
    * item num 2-2-1<br>
    * item num 2-2-2<br>
      * item num 2-2-1<br>
      * item num 2-2-2<br>
    * item num 2-2-3<br>
  * item num 2-2-3<br>
* item num 3<br>

- item num 1<br>
- item num 2<br>
  - item num 2-1<br>
  - item num 2-2<br>
    - item num 2-2-1<br>
     item num 2-2-2<br>
      - item num 2-2-1<br>
      - item num 2-2-2<br>
    - item num 2-2-3<br>
  - item num 2-2-3<br>
- item num 3<br>

1. item 1<br>
2. item 2<br>
   * item 2-1<br>
3. item 3<br>
   * item 3-1<br>
     * item 3-1-1<br>

#       图片和链接<br>
[Baidu](www.baidu.com)<br>
自动显示URL链接：https://www.baidu.com，www.baidu.com<br>
[Link](github.com)<br>
![picture die show this](http://7xp01z.com1.z0.glb.clouddn.com/books.png "mouse on shou this")<br>

#       引用文字<br>
The below is an example of block quotes.<br>
>       quoted num 1.<br>
>>      quoted num 2.<br>
>>>     quoted num 3.<br>
>>>>    quoted num 4.<br>
>>>>>   quoted num 5.<br>
>>>>>>  quoted num 6.<br>
>>>>>>> quoted num 7.<br>

> * quoted num 8.<br>
>>- quoted num 9.<br>
>>>* quote num 10.<br>
>>>>- quote num 11.<br>


This is an example of `inline` code. put code in a pair of \` (the key of `~`)<br>

代码块：成对的三个 ```符号构成代码块<br>
```
void fun(int x)
{
        return 0;
}
```

语法高亮：在开始的三个```符号后加入语言名，如：c/C, c++/C++, bash/Bash, makefile/Makefile<br>
```C
void fun(int x)
{
        return 0;
}
```

```c++
template<T>
T fun(T var)
{
        return var;
}
```

```bash
VAR=`pwd`
if [ ${VAR} != "/home" ]
then
        echo "do something"
else
        echo "do others"
fi
```

```makefile
all:
        gcc main.c inx.h inxy.h
clean:
        rm -f *.out *.o
```

```cmake
cmake_minimum_required(VERSION 2.8.7)
project(NAME)
set(MACRO_VAR 1)
add_executable(NAME src.cpp)
```

#       表格<br>
### work good, look good, src good
first header | second header | third header
-------------|---------------|-------------
content cell | content cell  | content cell
content cell | content cell  | content cell
content cell | content cell  | content cell

| first header | second header | third header |
| -------------|---------------|------------- |
| content cell | content cell  | content cell |
| content cell | content cell  | content cell |
| content cell | content cell  | content cell |

### work good, look good, src bad
fsss heer | second ahohohohheader | third heihihhihader 
-------------|---------------|------------- 
 cel | cotentfhohfwfa cell  | consfcell 
cll | conent cell  | contefaj

### 冒号左侧表示左对齐，冒号右侧表示右对齐
### 冒号两侧表示居中对齐，无冒号表示左对其
| first header | second header | third header | fourth col |
|:------------ |--------------:|------------- |:----------:|
| cell | cell  | cell | cell |
| cell | cell  | cell | cell |
| cell | cell  | cell | cell|

#       任务列表<br>
- [x] taget list, num 1, complete task, @charlie<br>
  - [x] taget list, num 1-1, complete sub task
  - [ ] taget list, num 1-2, incomplete sub task
    - [x] taget list, num 1-2-1, complete sub task
    - [ ] taget list...
      - [x] task list ...
      - [ ] task list ...
        - [x] task list
- [x] taget list, num 2, @username<br>
- [x] taget list, num 1, @charlie-wong<br>
- [x] taget list, num 2, @kneath, => at some person<br>
- [ ] taget list, num 3<br>
- [ ] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported

#       表情列表<br>
:smile:         :smirk:
:laughing:      :satisfied:

#       Github
1. 评论时输入 `#` 显示任务号列表
2. 评论时输入 `@` 显示要`at`的人的名字
