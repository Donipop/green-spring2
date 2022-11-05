<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 보기 </title>
    <link rel="stylesheet" href="/css/message.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

     <script>


            		   $.ajax( {
            			   url  :  '/getcontnote?_id=29' ,
            			   data :  {
            			       recept : $('#recept').val(),
            				   content : $('#content').val(),
            				   send : $('#send').val() ,
            				   time : $('#time').val() ,
            		       },
            		       method   : "GET",
            		       dataType:  "json"
            		   } )
            		   .done(function( result, textStatus, xhr ) {
            			   console.log( result );
            			   var resultStr = JSON.stringify( result ); // JSOn -> string

                         var recept = result[0].recept
                         var content = result[0].content
                         var send = result[0].send
                         var time = 1234

                         console.log(send);

                        document.getElementById("send").innerHTML = send
                        document.getElementById("cont").innerHTML = content
            		   })
            		   .fail(function(error, textStatus, errorThrown ) {
            			   console.log ( error );
            			   alert('Error:' + error)
            		   });





            </script>
</head>
<body>
    <section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">내용 보기</h3>


                <ul class="top_buttons">
                    <li><a href="/RecepMessage">받은 쪽지함</a></li>
                    <li><a href="/SendMessage">보낸 쪽지함</a></li>
                </ul>
               <form action="/writeNoteForm" method="post" name="message_form">
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1">보낸 사람 : </span>
                                    <span class="col2"><div id="send"></div></span>
                                </li>

                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea name="content" id = "cont" readonly ></textarea></span>
                                </li>
                            </ul>
                            <input type="submit" value="답장보내기">
                        </div>
                </form>
            </div>
 
        </div>
 
    </section>
 
    
</body>
</html>