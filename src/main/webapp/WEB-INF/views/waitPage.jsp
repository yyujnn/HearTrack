<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html class="no-js">



<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>wait</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
        ================================================== -->
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        @font-face {
            font-family: 'NEXON Lv2 Gothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @keyframes tipsy {
            0% {
                transform: translateX(-50%) translateY(-50%) rotate(0deg);
            }

            100% {
                transform: translateX(-50%) translateY(-50%) rotate(360deg);
            }
        }

        body {
            font-family: 'NEXON Lv2 Gothic', arial, sans-serif;
            background-color: #2e2e31;
        }

        a {
            color: #fffbf1;
            text-shadow: 0 20px 25px #2e2e31, 0 40px 60px #2e2e31;
            font-size: 60px;
            font-weight: bold;
            text-decoration: none;
            letter-spacing: 2px;
            margin: 0;
            width: 865px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
        }

        a:before,
        a:after {
            content: '';
            padding: .9em .4em;
            position: absolute;
            left: 50%;
            width: 100%;
            top: 50%;
            display: block;
            border: 15px solid red;
            transform: translateX(-50%) translateY(-50%) rotate(0deg);
            animation: 10s infinite alternate ease-in-out tipsy;
        }

        a:before {
            border-color: #1875FF #1875FF rgba(0, 0, 0, 0) rgba(0, 0, 0, 0);
            z-index: -1;
        }

        a:after {
            border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #1875FF #1875FF;
            box-shadow: 25px 25px 25px rgba(46, 46, 49, .8);
        }

        .lds-ellipsis {
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
        }

        .lds-ellipsis div {
            position: absolute;
            top: 80px;
            width: 13px;
            height: 13px;
            border-radius: 50%;
            background: #fffbf1;
            animation-timing-function: cubic-bezier(0, 1, 1, 0);
        }

        .lds-ellipsis div:nth-child(1) {
            left: 8px;
            animation: lds-ellipsis1 0.6s infinite;
        }

        .lds-ellipsis div:nth-child(2) {
            left: 8px;
            animation: lds-ellipsis2 0.6s infinite;
        }

        .lds-ellipsis div:nth-child(3) {
            left: 32px;
            animation: lds-ellipsis2 0.6s infinite;
        }

        .lds-ellipsis div:nth-child(4) {
            left: 56px;
            animation: lds-ellipsis3 0.6s infinite;
        }

        @keyframes lds-ellipsis1 {
            0% {
                transform: scale(0);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes lds-ellipsis3 {
            0% {
                transform: scale(1);
            }

            100% {
                transform: scale(0);
            }
        }

        @keyframes lds-ellipsis2 {
            0% {
                transform: translate(0, 0);
            }

            100% {
                transform: translate(24px, 0);
            }
        }
    </style>
</head>

<body>
    <section>

        <a href="http://www.thismanslife.co.uk" target="_blank"><span style="color: #1875FF;">AI</span>로 결과를 <span
                style="color: #f26464;">분석</span>하는 중 입니다<div class="lds-ellipsis">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div></a>
    </section>
</body>

</html>