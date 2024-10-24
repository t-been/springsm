package edu.sm.controller;

import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("center", dir + "get");
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

        return "redirect:/cart"; // "redirect:/cart/get" 대신 "redirect:/cart"로 수정
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("custId") String custId, @RequestParam("itemId") Integer itemId) {
        log.info("Deleting cart item - custId: {}, itemId: {}", custId, itemId);
        try {
            CartDto cartDto = CartDto.builder()
                    .cartUserId(custId)
                    .cartItemId(itemId)
                    .build();
            cartService.del(cartDto);  // 서비스의 삭제 메서드를 호출
        } catch (Exception e) {
            log.error("Error while deleting cart item", e);
            throw new RuntimeException(e);
        }

        return "redirect:/cart";
    }

    @RequestMapping("/count")
    public String count(@RequestParam("custId") String custId,
                        @RequestParam("itemId") Integer itemId,
                        @RequestParam("plma") Integer plma) throws Exception {
        CartDto cart_ = CartDto.builder()
                .cartUserId(custId)
                .cartItemId(itemId)
                .build();
        CartDto cart = cartService.get(cart_);
        if (plma == 1) {
            cart.setCartCount(cart.getCartCount() + 1);
        } else if (plma == -1) {
            if (cart.getCartCount() > 1) {
                cart.setCartCount(cart.getCartCount() -1);
            }
        }
        cartService.modify(cart);
        return "redirect:/cart";
    }



}