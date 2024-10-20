package jp.focus.line.calm.sample;

import java.util.Map;
import jp.focus.line.calm.config.FileOptions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

  private final Map<String, FileOptions> assetManifest;

  public HomeController(Map<String, FileOptions> assetManifest) {
    this.assetManifest = assetManifest;
  }

  @GetMapping("/home")
  public String home(Model model) {
    // main.tsx のエントリからハッシュ付きファイル名を取得
    FileOptions mainEntry = assetManifest.get("src/main.tsx");
    model.addAttribute("jsFile", mainEntry.getFile());
    model.addAttribute("cssFiles", mainEntry.getCss());

    return "index";
  }
}
