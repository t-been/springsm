<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let add ={
        init:function(){
            $('#add_form > button').click(()=>{
                this.check();
            });
        },
        check:function(){
            let model = $('#model').val();
            let price = $('#price').val();
            if(model == '' || model == null){
                alert('Model is Mandatory');
                $('#model').focus();
                return;
            }
            if(price == '' || price == null){
                alert('Price is Mandatory');
                $('#price').focus();
                return;
            }
            this.send();
        },
        send:function(){
            // method, action
            $('#add_form').attr('method','post');
            $('#add_form').attr('action','/car/addimpl');
            $('#add_form').submit();
        }
    };
    $(function(){
        add.init();
    });
</script>
<div class="col-sm-10">
    <h2>Car Insert Page</h2>
    <div class="row">
        <div class="col-sm-5">
            <form id="add_form">
                <div class="form-group">
                    <label for="model">Model:<span id="model_span"></span></label>
                    <input type="text" class="form-control" placeholder="Enter Model" id="model" name="carModel">
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" class="form-control" placeholder="Enter Price" id="price" name="carPrice">
                </div>
                <div class="form-group">
                    <label for="img">ImgName:</label>
                    <input type="text" class="form-control" placeholder="Enter ImgName" id="img" name="imgName">
                </div>
                <button type="button" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>