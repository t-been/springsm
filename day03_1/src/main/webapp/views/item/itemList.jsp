<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-10-08
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">상품목록</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
        <tr>
          <th>ItemId</th>
          <th>Name</th>
          <th>Price</th>
          <th>Img</th>
          <th>Text</th>
          <th>Reg_Date</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
          <th>ItemId</th>
          <th>Name</th>
          <th>Price</th>
          <th>Img</th>
          <th>Text</th>
          <th>Reg_Date</th>
        </tr>
        </tfoot>
        <tbody>
        <tr>
          <td>001</td>
          <td>Hat</td>
          <td>$20.00</td>
          <td>Hat.img</td>
          <td>Stylish summer hat</td>
          <td>2023/01/10</td>
        </tr>
        <tr>
          <td>002</td>
          <td>Pants</td>
          <td>$35.00</td>
          <td>Pants.img</td>
          <td>Comfortable cotton pants</td>
          <td>2023/02/15</td>
        </tr>
        <tr>
          <td>003</td>
          <td>T-Shirt</td>
          <td>$15.00</td>
          <td>TShirt.img</td>
          <td>Casual white t-shirt</td>
          <td>2023/03/20</td>
        </tr>
        <tr>
          <td>004</td>
          <td>Jacket</td>
          <td>$55.00</td>
          <td>Jacket.img</td>
          <td>Warm winter jacket</td>
          <td>2023/04/18</td>
        </tr>
        <tr>
          <td>005</td>
          <td>Shoes</td>
          <td>$40.00</td>
          <td>Shoes.img</td>
          <td>Comfortable walking shoes</td>
          <td>2023/05/25</td>
        </tr>
        <tr>
          <td>006</td>
          <td>Socks</td>
          <td>$5.00</td>
          <td>Socks.img</td>
          <td>Colorful cotton socks</td>
          <td>2023/06/02</td>
        </tr>
        <tr>
          <td>007</td>
          <td>Scarf</td>
          <td>$12.00</td>
          <td>Scarf.img</td>
          <td>Cozy wool scarf</td>
          <td>2023/07/10</td>
        </tr>
        <tr>
          <td>008</td>
          <td>Gloves</td>
          <td>$18.00</td>
          <td>Gloves.img</td>
          <td>Warm winter gloves</td>
          <td>2023/08/22</td>
        </tr>
        <tr>
          <td>009</td>
          <td>Sunglasses</td>
          <td>$25.00</td>
          <td>Sunglasses.img</td>
          <td>Trendy sunglasses</td>
          <td>2023/09/12</td>
        </tr>
        <tr>
          <td>010</td>
          <td>Backpack</td>
          <td>$45.00</td>
          <td>Backpack.img</td>
          <td>Durable hiking backpack</td>
          <td>2023/10/01</td>
        </tr>
        <tr>
          <td>011</td>
          <td>Belt</td>
          <td>$22.00</td>
          <td>Belt.img</td>
          <td>Leather belt</td>
          <td>2023/01/18</td>
        </tr>
        <tr>
          <td>012</td>
          <td>Watch</td>
          <td>$150.00</td>
          <td>Watch.img</td>
          <td>Classic wristwatch</td>
          <td>2023/02/10</td>
        </tr>
        <tr>
          <td>013</td>
          <td>Bracelet</td>
          <td>$30.00</td>
          <td>Bracelet.img</td>
          <td>Gold bracelet</td>
          <td>2023/03/08</td>
        </tr>
        <tr>
          <td>014</td>
          <td>Necklace</td>
          <td>$75.00</td>
          <td>Necklace.img</td>
          <td>Elegant necklace</td>
          <td>2023/04/21</td>
        </tr>
        <tr>
          <td>015</td>
          <td>Wallet</td>
          <td>$50.00</td>
          <td>Wallet.img</td>
          <td>Leather wallet</td>
          <td>2023/05/11</td>
        </tr>
        <tr>
          <td>016</td>
          <td>Cap</td>
          <td>$18.00</td>
          <td>Cap.img</td>
          <td>Sporty cap</td>
          <td>2023/06/19</td>
        </tr>
        <tr>
          <td>017</td>
          <td>Sneakers</td>
          <td>$60.00</td>
          <td>Sneakers.img</td>
          <td>Comfortable sneakers</td>
          <td>2023/07/25</td>
        </tr>
        <tr>
          <td>018</td>
          <td>Flip-flops</td>
          <td>$10.00</td>
          <td>FlipFlops.img</td>
          <td>Beach flip-flops</td>
          <td>2023/08/12</td>
        </tr>
        <tr>
          <td>019</td>
          <td>Umbrella</td>
          <td>$8.00</td>
          <td>Umbrella.img</td>
          <td>Compact umbrella</td>
          <td>2023/09/05</td>
        </tr>
        <tr>
          <td>020</td>
          <td>Keychain</td>
          <td>$5.00</td>
          <td>Keychain.img</td>
          <td>Metallic keychain</td>
          <td>2023/10/11</td>
        </tr>
        <tr>
          <td>021</td>
          <td>Notebook</td>
          <td>$12.00</td>
          <td>Notebook.img</td>
          <td>Leather-bound notebook</td>
          <td>2023/11/03</td>
        </tr>
        <tr>
          <td>022</td>
          <td>Pen</td>
          <td>$7.00</td>
          <td>Pen.img</td>
          <td>Stylish ballpoint pen</td>
          <td>2023/12/15</td>
        </tr>
        <tr>
          <td>023</td>
          <td>Mug</td>
          <td>$10.00</td>
          <td>Mug.img</td>
          <td>Ceramic coffee mug</td>
          <td>2024/01/08</td>
        </tr>
        </tbody>
      </table>
      <!-- Pagination Controls -->
      <div class="d-flex justify-content-between">
        <div>
          Showing 1 to 10 of 23 entries
        </div>
        <div>
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
