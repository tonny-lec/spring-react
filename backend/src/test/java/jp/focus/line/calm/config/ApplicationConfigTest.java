package jp.focus.line.calm.config;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.util.Map;
import java.util.Objects;

import org.junit.jupiter.api.Test;
import org.thymeleaf.util.StringUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ApplicationConfigTest {

    @Test
    void testManifestJsonLoading() throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        File manifestFile = new File("src/main/resources/static/.vite/manifest.json");

        // manifest.json が存在することを確認
        assertTrue(manifestFile.exists(), "manifest.json が見つかりません");

        // JSON を Map に読み込み、特定のキーが存在するか確認
        Map<String, FileOptions> manifest = mapper.readValue(manifestFile,
                new TypeReference<>() {
                });
        // main.tsx のエントリからハッシュ付きファイル名を取得
        FileOptions mainEntry = manifest.get("src/main.tsx");
        assertTrue(!Objects.isNull(mainEntry), "main.js のエントリが見つかりません");

        assertTrue(StringUtils.contains(mainEntry, "assets/main"), "main.js のエントリが見つかりません");
    }
}
