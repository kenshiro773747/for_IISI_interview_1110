	var E = window.wangEditor
		var editor = new E('#div1')
	    var $text1 = $('#text1')
	    
    editor.config.onchange = function (html) {
        // 第二步，监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.config.zIndex = 0
    // 第一步，初始化 textarea 的值
    $text1.val(editor.txt.html())
    
    
   editor.config.showLinkImg = false
     
     editor.config.excludeMenus = [
        'video',
        'table',
        'image',
        'bold',
        'head',
        'link',
        'italic',
        'underline',
        'emoji',
        'backColor',
   		 'code', 
   		 'list',
    	 'todo',
  
    ]
    
    
    $("#testReset").on("click",function(){
		editor.txt.clear();
})

   $("#UpdateReset").on("click",function(){
	document.getElementById('title').value="";
		editor.txt.clear();
		
})
    
   
  $("#replyInput").on("click",function(){
	 editor.txt.append('<p>那家超雷</p>')
		
})


    editor.create();//创建在所有配置之后
    