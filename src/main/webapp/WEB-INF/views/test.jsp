<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div>
  <div>
    <h2>상품 등록 폼</h2>
  </div>
  <h4>상품 입력</h4>

  <form action="/testSuc" method="post" enctype="multipart/form-data">
    <ul>
      <li>상품명<input type="text" name="itemName"></li>
      <li>파일<input type="file" name="file" ></li>
    </ul>
    <input type="submit"/>
  </form>
</div>
</body>
</html>