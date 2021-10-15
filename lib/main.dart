import 'package:flutter/material.dart';

//2.4 路由管理
/**
 * 路由（Route）在移动开发中通常指页面（Page），这跟 Web 开发中单页应用的 Route 概念意义是相同的，
 * Route 在 Android中 通常指一个 Activity，在 iOS 中指一个 ViewController。
 * 所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。Flutter 中的路由管理和原生开发类似，
 * 无论是 Android 还是 iOS，导航管理都会维护一个路由栈，路由入栈（push）操作对应打开一个新页面，
 * 路由出栈（pop）操作对应页面关闭操作，而路由管理主要是指如何来管理路由栈。
 * */

//2.4.1 一个简单示例
void main() { //应用入口。
  runApp(const MyApp());
}

//应用结构。
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: '基础组件'),
    );
  }
}
//2.1.2 首页
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   // 3.4 单选开关和复选框
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text 用于显示简单样式文本，它包含一些控制文本显示样式的一些属性，一个简单的例子如下：
            const Text('文本练习用于显示简单样式文本',
              // style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.left, //textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。
              maxLines: 1,
            ),
            const Text("Hello world! I'm Jack",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
             /**
              * 注意：Text文本组建创建时，如果有黄色警告，在后面加一个const就可以消除黄色警告了
              * */
             Text("Hello world"*3,
              textScaleFactor: 1.5,
             ),
            //3.1.2 TextStyle
            //TextStyle用于指定文本显示的样式如颜色、字体、粗细、背景等。我们看一个示例
            Text("Hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2, //该属性用于指定行高，
                fontFamily: "Courier",
                background: Paint()..color=Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            /**  3.2 按钮
             * Material 组件库中提供了多种按钮组件如ElevatedButton、TextButton等，
             * 它们都是直接或间接对RawMaterialButton组件的包装定制，所以他们大多数属性都和RawMaterialButton一样。
             * */
            ),
            ElevatedButton( //第一种按钮
                //ElevatedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大，
                onPressed: (){},
                child:const Text("normal"),
            ),
            TextButton( //第二种按钮
                //TextButton即文本按钮，默认背景透明并不带阴影。按下后，会有背景色
                onPressed: (){},
                child: const Text("Submit"),
            ),
            IconButton( //背景按钮
                //IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
                onPressed: (){},
                icon: Icon(Icons.thumb_up),
            ),
            ElevatedButton.icon( //第一种带图标的按钮
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: (){},
            ),
            TextButton.icon( //第二种带图标的按钮
              icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: (){},
            ),
          /** 3.3 图片及ICON
           *  3.3.1 图片
           * Flutter中，我们可以通过Image组件来加载并显示图片,Image的数据源可以是asset、文件、内存以及网络。
           * ImageProvider:是一个抽象类,主要定义了图片数据获取的接口load(),从不同的数据源获取图片需要实现不同的ImageProvider
           * 如AssetImage是实现了从Asset中加载图片的 ImageProvider，而NetworkImage 实现了从网络加载图片的 ImageProvider。
           * Image:Image widget 有一个必选的image参数，它对应一个ImageProvider。下面我们分别演示一下如何从 asset 和网络加载图片。
           *
           * */
           const Image(
             image: AssetImage("images/avatar.png"),
             width: 100.0,
           ),
          //  网络加载图片
           const Image(
              image: NetworkImage("https://pics2.baidu.com/feed/7dd98d1001e939011e167259558e11ee36d19628.jpeg?token=5106151ee90dd31f95d134289e32cbe2"),
              width: 200.0,
              height: 300.0,
           ),
          //  3.4 单选开关和复选框
            Switch(
                value: _switchSelected,
                onChanged: (value){
            //      重新构建页面
                setState(() {
                _switchSelected=value;
                });
             },
            ),
            Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value){
                  setState(() {
                    // _checkboxSelected=value;
                  });
                },
            ),
            
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
