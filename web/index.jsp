<html>
<head>
    <title>Kotlin to Java / Converter
    </title>

    <%@include file="common_headers.jsp" %>
    <style>
        body {
            background-color: #f5f5f5;
        }

        .CodeMirror-fullscreen {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            height: auto;
            z-index: 9;
        }

        .CodeMirror {
            height: 80%;
        }

        .CodeMirror {
            border: 1px solid silver;
        }

        .CodeMirror-empty.CodeMirror-focused {
            outline: none;
        }

        .CodeMirror pre.CodeMirror-placeholder {
            color: #999;
        }
    </style>

    <script>

        $(document).ready(function () {


            var kotlinEditor = CodeMirror.fromTextArea(document.getElementById("kotlinCode"), {
                lineNumbers: true,
                mode: "text/x-kotlin",
                matchBrackets: true,
                extraKeys: {
                    "F11": function (cm) {
                        cm.setOption("fullScreen", !cm.getOption("fullScreen"));
                    },
                    "Esc": function (cm) {
                        if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
                    }
                }
            });

            var javaEditor = CodeMirror.fromTextArea(document.getElementById("javaCode"), {
                lineNumbers: true,
                mode: "text/x-java",
                matchBrackets: true,
                extraKeys: {
                    "F11": function (cm) {
                        cm.setOption("fullScreen", !cm.getOption("fullScreen"));
                    },
                    "Esc": function (cm) {
                        if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
                    }
                }
            });

            function startLoading() {
                kotlinEditor.setOption('readOnly', 'nocursor');
                $("button#bGenButterLayout").prop('disabled', true);
            }

            function stopLoading() {
                kotlinEditor.setOption('readOnly', false);
                $("button#bGenButterLayout").prop('disabled', false);
            }

            $("button#bGenButterLayout").click(function () {

                $("p#error_message").text("");

                var kotlinData = kotlinEditor.getDoc().getValue();

                $.ajax({
                    type: "POST",
                    beforeSend: function (request) {
                        startLoading();
                    },
                    url: "get_kotlin_to_java",
                    data: {
                        kotlin_code: kotlinData
                    },
                    success: function (data) {
                        stopLoading();
                        console.log(data);

                        if (!data.error) {
                            javaEditor.getDoc().setValue(data.data.java_code);
                            $("p#error_message").text("");
                        } else {
                            $("p#error_message").text(data.message);
                        }
                    },
                    error: function () {
                        stopLoading();
                        $("p#error_message").text("Network error occurred, Please check your connection");
                    }
                });


            });


        });
    </script>

</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h1>Kotlin to Java</h1>
            <p class="text-muted">A simple kotlin to java converter</p>
        </div>
    </div>


    <br>


    <div class="row">
        <div class="col-md-12">
            <p id="error_message" class="text-danger"></p>
        </div>
    </div>

    <div class="row">

        <div class="col-md-5">
            <textarea id="kotlinCode" placeholder="Paste your Kotlin code here" class="form-control"
                      style="width: 100%;height: 80%"></textarea>
        </div>

        <div class="col-md-2 text-center">

            <button id="bGenButterLayout" class="btn btn-primary"><span
                    class="glyphicon glyphicon glyphicon-cog"></span> Convert
            </button>
        </div>
        <div class="col-md-5">
            <textarea id="javaCode" placeholder="Your java code will get generate here" class="form-control"
                      style="width: 100%;height: 80%"></textarea>
        </div>
    </div>


</div>
</body>


</html>