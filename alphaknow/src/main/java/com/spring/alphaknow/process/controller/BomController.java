package com.spring.alphaknow.process.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.alphaknow.dto.BOMItem;
import com.spring.alphaknow.process.service.BomService;

@Controller
@RequestMapping("/bom")
public class BomController {

    private final BomService bomService;

    @Autowired
    public BomController(BomService bomService) {
        this.bomService = bomService;
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ResponseEntity<?> getBomDetailsAsHtmlTable(@RequestParam String bomId) {
        List<BOMItem> bomItems = bomService.findBOMItemsByBomId(bomId);
        if (bomItems.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        StringBuilder tableHtml = new StringBuilder("<table border='1'>");
        tableHtml.append("<tr><th>Item ID</th><th>BOM ID</th><th>Product Seq</th><th>Quantity</th><th>Unit</th></tr>");
        for (BOMItem item : bomItems) {
            tableHtml.append(String.format("<tr><td>%s</td><td>%s</td><td>%d</td><td>%d</td><td>%s</td></tr>",
                item.getItemId(), item.getBomId(), item.getProductSeq(), item.getQuantity(), item.getUnit()));
        }
        tableHtml.append("</table>");

        return ResponseEntity.ok(tableHtml.toString());
    }
}