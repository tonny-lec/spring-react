package jp.focus.line.calm.web.sample;

import java.util.Map;
import jp.focus.line.calm.config.FileOptions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/** sample controller. */
@Controller
public class HomeController {

  private final Map<String, FileOptions> assetManifest;

  /** constructor. */
  public HomeController(Map<String, FileOptions> assetManifest) {
    this.assetManifest = assetManifest;
  }

  /**
   * initialize of "/home".
   *
   * @param model model.
   * @return use html file path.
   */
  @GetMapping("/home")
  public String home(Model model) {
    // main.tsx のエントリからハッシュ付きファイル名を取得
    FileOptions mainEntry = assetManifest.get("src/main.tsx");
    model.addAttribute("jsFile", mainEntry.getFile());
    model.addAttribute("cssFiles", mainEntry.getCss());

    return "home/index";
  }
}
