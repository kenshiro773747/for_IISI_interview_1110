	const E = window.wangEditor
		const editor = new E('#div1')
	    const $text1 = $('#text1')
    editor.config.onchange = function (html) {
        // 第二步，监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.config.zIndex = 0
    // 第一步，初始化 textarea 的值
    $text1.val(editor.txt.html())
    
    $("#testReset").on("click",function(){
		editor.txt.clear();
})

   $("#UpdateReset").on("click",function(){
	document.getElementById('title').value="";
		editor.txt.clear();
		
})
    

    
  $("#input").on("click",function(){
	document.getElementById("example-text-input").value ="貓咪手作早午餐店";
	document.getElementById("exampleFormControlSelect1").value ="1";
	 editor.txt.append('<p>位在西門町商圈周邊的早初，是間充滿創意及巧思的小店三層樓的用餐空間採光極佳，裝潢設計給人一種溫馨之感店裡有著各式各樣的明信片，甚至能挑選自己喜歡的樣式在上頭留下給未來自己的話，寄放在店內留給未來的自己<br/></p><p>▷淡忘起司雞法式歐蕾吐司＊２２０<br/></p><p><img src="images/aa5fc92b3145440d992737b4b4a6cb4d圖.jpeg" style="max-width:100%;" contenteditable="false" width="274.76" height="274.76"/><br/><br/></p><p>浸過蛋液後煎出的歐蕾吐司，口感比一般烤吐司來得柔和中間夾的是雞腿排與起司片，再放上太陽蛋整體味道蠻好另一道紙包雞料理更有特色，將雞蛋.水果.堅果果乾.芋泥薯塊和伯爵司康放入雞蛋盒，最喜歡司康和綿密的芋泥球每一種元素份量都小小巧巧，嚐到多種風味卻不會有負擔<br/></p><p><img src="images/bc6fa870d8d24925a6d919bfb1cef123圖.jpeg" style="max-width:100%;" contenteditable="false" width="271.76" height="271.76"/></p>')
		
})

    
  $("#hot").on("click",function(){
	document.getElementById("example-text-input").value ="公告5";
	document.getElementById("exampleFormControlSelect1").value ="1";
	 editor.txt.append('<p>[公告]新註冊會員，需要先發一篇文，方可自行發文<br/>[主旨]防止色情發文<br/>[說明]<br/>1.新會員需先發一篇文，經由管理員審核後。<br/>2.由[新註冊會員]變成[註冊會員]，才能自行發文，不經審核。<br/></p>')
		
})

 //    设置上传本地图片到服务器
    editor.config.uploadImgServer =  'images';//与后端访问接口保持一致
    editor.config.uploadFileName = 'img'//文件名作为后端接收的参数名
    editor.config.uploadImgHooks = {
        //配置自动插入到编辑器
        customInsert: function (insertImgFn, result) {
            // result 即服务端返回的接口
            // insertImgFn 可把图片插入到编辑器，传入图片 src ，执行函数即可
            insertImgFn(result.data[0])
        }
    }
    //设置图片大小
    editor.config.uploadImgMaxSize = 10 * 1024 * 1024 // 10M
    editor.config.uploadImgMaxLength = 10 // 一次最多上传 10 个图片

    editor.create();//创建在所有配置之后
    