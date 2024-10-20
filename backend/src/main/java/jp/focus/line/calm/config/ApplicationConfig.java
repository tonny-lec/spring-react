package jp.focus.line.calm.config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/** Aplication Config. */
@Configuration
public class ApplicationConfig implements WebMvcConfigurer {

  /**
   * created manifest.json from vite of React. include it and parse json.
   *
   * @return parsed json.
   * @throws IOException failed parse json.
   */
  @Bean
  public Map<String, FileOptions> assetManifest() throws IOException {
    ObjectMapper mapper = new ObjectMapper();
    File manifestFile = new File("src/main/resources/static/.vite/manifest.json");

    return mapper.readValue(manifestFile, new TypeReference<>() {});
  }
}
