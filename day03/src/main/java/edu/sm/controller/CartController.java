package edu.sm.controller;

import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    final CartService cartService;
    String dir = "cart/";

    @RequestMapping("")
    public String get(Model model, HttpSession session) throws Exception {
        List<CartDto> carts = null;
        CustDto custDto = (CustDto) session.getAttribute("loginid");
        String custId = custDto.getCustId();
        carts = cartService.getByCustId(custId);
        model.addAttribute("carts", carts);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get"); // 경로가 올바르게 설정되어 있는지 확인
        return "index";
    }


    @RequestMapping("/add")
    public String add(@RequestParam("custId") String custId, @RequestParam("itemId") Integer itemId) {
        log.info("custId: " + custId);
        log.info("itemId: " + itemId);
        try {
            CartDto cartDto = CartDto.builder()
                    .cartUserId(custId)
                    .cartItemId(itemId)
                    .cartCount(1)
                    .build();
            cartService.add(cartDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/cart"; // 장바구니 페이지로 리다이렉트
    }

    @RequestMapping("/get")
    public String getCart(Model model, HttpSession session) throws Exception {
        // 세션에서 로그인된 사용자의 정보를 가져옵니다.
        CustDto custDto = (CustDto) session.getAttribute("loginid");
        if (custDto == null) {
            throw new RuntimeException("사용자가 로그인되지 않았습니다.");
        }

        String custId = custDto.getCustId();
        List<CartDto> carts = cartService.getByCustId(custId);

        model.addAttribute("carts", carts);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }


    @PostMapping("/delete")
    public String delete(@RequestParam("custId") String custId, @RequestParam("itemId") Integer itemId) {
        log.info("Deleting cart item - custId: {}, itemId: {}", custId, itemId);
        try {
            CartDto cartDto = CartDto.builder()
                    .cartUserId(custId)
                    .cartItemId(itemId)
                    .build();00
            cartService.del(cartDto);
        } catch (Exception e) {
            log.error("Error while deleting cart item", e);
            throw new RuntimeException(e);
        }

        return "redirect:/cart";
    }

    @PostMapping("/count")
    public String count(@RequestParam("custId") String custId,
                        @RequestParam("itemId") Integer itemId,
                        @RequestParam("plma") Integer plma) throws Exception {
        CartDto cart = cartService.get(CartDto.builder()
                .cartUserId(custId)
                .cartItemId(itemId)
                .build());
        if (plma == 1) {
            cart.setCartCount(cart.getCartCount() + 1);
        } else if (plma == -1 && cart.getCartCount() > 1) {
            cart.setCartCount(cart.getCartCount() - 1);
        }
        cartService.modify(cart);
        return "redirect:/cart";
    }
}
