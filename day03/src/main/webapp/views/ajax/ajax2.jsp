<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ajax2 = {
        init : function(){
            setInterval(()=>{this.getData();}, 5000);
        },
        getData:function() {
            $.ajax({
                'url' : "<c:url value='/getranking' />",
                'success': (result)=> {
                    this.display(result);
                }
            });
        },
        display:function(result){
            let rankingHtml = "";

            result.forEach(function(item) {
                rankingHtml += "<tr>";
                rankingHtml += "<td>" + item.rank + "</td>";
                rankingHtml += "<td>" + item.name + "</td>";
                rankingHtml += "</tr>";
            });

            $("#rankingTable tbody").html(rankingHtml);
        }
    };

    $(function () {
        ajax2.init();
    });
</script>

<div class="col-sm-10">
    <h2>AJAX2 Page</h2>
    <h5>인기 순위</h5>
    <table class="table" id="rankingTable">
        <thead class="thead-dark">
        <tr>
            <th>순위</th>
            <th>이름</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
