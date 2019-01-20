# Brief Intro Markdown Syntax

1. The empty line represents the beginning of another paragraph.
2. The **asterisk** sign (\*), the **plus** sign (\+), and the **minus** sign (\-) have the same effect.
3. Two consecutive **spaces** will become a newline sign.
4. The backslash (\\) can be used to escape.
5. More than Three consecutive **plus** sign (`---`) will show as separation line, as following.
-------------------------------------------------------------------------------
6. Markdown character that has special meaning, which need to escape.

   - \\&nbsp;&nbsp;&nbsp;&nbsp;backslash
   - ` &nbsp;&nbsp;&nbsp;&nbsp;backtick
   - \*&nbsp;&nbsp;&nbsp;&nbsp;asterisk
   - _ &nbsp;&nbsp;&nbsp;&nbsp;underscore
   - {}&nbsp;&nbsp;&nbsp;      curly braces
   - []&nbsp;&nbsp;&nbsp;      square brackets
   - ()&nbsp;&nbsp;&nbsp;      parentheses
   - \#&nbsp;&nbsp;&nbsp;&nbsp;hash mark
   - \+&nbsp;&nbsp;&nbsp;&nbsp;plus sign
   - \-&nbsp;&nbsp;&nbsp;&nbsp;minus sign (hyphen)
   - . &nbsp;&nbsp;&nbsp;&nbsp;dot
   - ! &nbsp;&nbsp;&nbsp;&nbsp;exclamation mark

# Use HTML Markup in Markdown

beg [<html>&ensp;&ensp;&ensp;&ensp;&ensp;]</html>  end

beg [&emsp;&emsp;&emsp;&emsp;&emsp;]               end

1. `&zwj;`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zero Width Joiner
2. `&nbsp;`&nbsp;&nbsp;&nbsp;&nbsp;No-Break Space
3. `&ensp;`&nbsp;&nbsp;&nbsp;&nbsp;En Space
4. `&emsp;`&nbsp;&nbsp;&nbsp;&nbsp;Em Space
5. `&thinsp;`&nbsp;&nbsp;Thin Space
6. `&zwnj;`&nbsp;&nbsp;&nbsp;&nbsp;Zero Width Non Joiner

# Title

#       this is an header leval 1
##      this is an header level 2
###     this is an header level 3
####    this is an header level 4
#####   this is an header level 5
######  this is an header level 6 (just only 6 header level in mark-down)


# Font

*italic*: `*text*`

_italic_: `_text_`

**bold**: `**text**`

__bold__: `__text__`

~~strikethrough~~: `~~text~~`

# List

* item num 1
* item num 2
  * item num 2-1
  * item num 2-2
    * item num 2-2-1
    * item num 2-2-2
      * item num 2-2-1
      * item num 2-2-2
    * item num 2-2-3
  * item num 2-2-3
* item num 3

- item num 1
- item num 2
  - item num 2-1
  - item num 2-2
    - item num 2-2-1
     item num 2-2-2
      - item num 2-2-1
      - item num 2-2-2
    - item num 2-2-3
  - item num 2-2-3
- item num 3

1. item 1
2. item 2
   * item 2-1
3. item 3
   * item 3-1
     * item 3-1-1

# Picture and Links

- Automatic linking for URLs, e.g: https://www.baidu.com
- `[LinkTitle](URL)`, e.g: [Baidu](https://www.baidu.com)
- `[LinkTtile][id]` or `[LinkTtile][]`, e.g: [gkide][gkide_url]
- `![AltText][URL]`, `![AltText][LocalPathToPicture]` or `![AltText][id]`
- `[id]: /path/to/img.jpg "Title"` or `[id]: URL "Title"`
- If `URL` is not with perfix `https://` or `http://`, then it will be interpreted local to current **base**.

![Picture Die Show This - 1](http://7xp01z.com1.z0.glb.clouddn.com/books.png "mouse on shou this")

![Picture Die Show This - 2][picture_url]

[picture_url]: http://7xp01z.com1.z0.glb.clouddn.com/books.png "PictureTitle"
  [gkide_url]: https://github.com/gkide/CodingArt              "gkide HomePage"
      [Baidu]: https://baidu.com                               "Baidu Homepage"

# Quote

The below is an example of block quotes.

>       quoted num 1: `>`
>>      quoted num 2: `>>`
>>>     quoted num 3: `>>>`
>>>>    quoted num 4: `>>>`
>>>>>   quoted num 5: `>>>>`
>>>>>>  quoted num 6: `>>>>>`

> * quoted num 8.
>>- quoted num 9.
>>>* quote num 10.
>>>>- quote num 11.

# Code Block
- This is an example of `inline` code, put code in a pair of \` (the key of `~`).
- Code block, a pair of three backticks(\`), that is <code>\`\`\` ... \`\`\`</code>.
- Syntax highlightING language name: ``c/C``, ``c++/C++``, ``bash/Bash``, ``makefile/Makefile``

---------------------------------------------------------------------
- Code Block: Default

```
    ```
    void fun(int x)
    {
        return 0;
    }
    ```
```

The result appeared as following:

```
void fun(int x)
{
    return 0;
}
```
---------------------------------------------------------------------
- Code Block: C

```
    ```C
    void fun(int x)
    {
        return 0;
    }
    ```
```

The result appeared as following:

```C
void fun(int x)
{
    return 0;
}
```
---------------------------------------------------------------------
- Code Block: C++

```
    ```c++
    template<T>
    T fun(T var)
    {
        return var;
    }
    ```
```

The result appeared as following:

```c++
template<T>
T fun(T var)
{
    return var;
}
```
---------------------------------------------------------------------
- Code Block: Bash

```
    ```bash
    VAR=`pwd`
    if [ ${VAR} != "/home" ]; then
        echo "do something"
    else
        echo "do others"
    fi
    ```
```

The result appeared as following:

```bash
VAR=`pwd`
if [ ${VAR} != "/home" ]; then
    echo "do something"
else
    echo "do others"
fi
```

---------------------------------------------------------------------
- Code Block: Makefile

```
    ```makefile
    all:
        gcc main.c inx.h inxy.h
    clean:
        rm -f *.out *.o
    ```
```

The result appeared as following:

```makefile
all:
    gcc main.c inx.h inxy.h
clean:
    rm -f *.out *.o
```

---------------------------------------------------------------------
- Code Block: CMake

```
    ```cmake
    cmake_minimum_required(VERSION 2.8.7)
    project(NAME)
    set(MACRO_VAR 1)
    add_executable(NAME src.cpp)
    ```
```

The result appeared as following:

```cmake
cmake_minimum_required(VERSION 2.8.7)
project(NAME)
set(MACRO_VAR 1)
add_executable(NAME src.cpp)
```

# Table

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

### work good, look good, source bad

fsss heer | second ahohohohheader | third heihihhihader
-------------|---------------|-------------
 cel | cotentfhohfwfa cell  | consfcell
cll | conent cell  | contefaj

### Aligned of table items

- The colon left is left aligned
- The colon right is right aligned
- The colon both is center aligned
- If no colon, then left aligned

| first header | second header | third header | fourth col |
|:------------ |--------------:|------------- |:----------:|
| cell | cell  | cell | cell |
| cell | cell  | cell | cell |
| cell | cell  | cell | cell|

# Task List

- [x] taget list, num 1, complete task, @charlie
  - [x] taget list, num 1-1, complete sub task
  - [ ] taget list, num 1-2, incomplete sub task
    - [x] taget list, num 1-2-1, complete sub task
    - [ ] taget list...
      - [x] task list ...
      - [ ] task list ...
        - [x] task list
- [x] taget list, num 2, @username
- [x] taget list, num 1, @charlie-wong
- [x] taget list, num 2, @kneath, => at some person
- [ ] taget list, num 3<br>
- [ ] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported

# Emoji

:smile:         :smirk:
:laughing:      :satisfied:

# Github

- SHA references.

  Any reference to a commit’s [SHA-1](http://en.wikipedia.org/wiki/SHA-1) hash will be automatically
  converted into a link to that commit on GitHub.

  ```
  16c999e8c71134401a78d4d46435517b2271d6ac
  people_name@16c999e8c71134401a78d4d46435517b2271d6ac
  organization_name@16c999e8c71134401a78d4d46435517b2271d6ac
  people_name/project_name@16c999e8c71134401a78d4d46435517b2271d6ac
  ```

- Issue references within a repository.

  Any number that refers to an Issue or Pull Request will be automatically converted into a link.
  ```
  #1
  people_name#1
  people_name/project_name#1
  ```
- Username @mentions

    Typing an ``@`` symbol, followed by a username, will notify that person to come and view the
    comment. This is called an **@mention**, because you’re mentioning the individual. You can also
    \@mention teams within an organization.
