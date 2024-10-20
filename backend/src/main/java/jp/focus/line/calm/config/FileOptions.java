package jp.focus.line.calm.config;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import lombok.Data;

/** React の vite が生成する manifestljson の値を受け取るDTO. */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FileOptions {
  private String file;
  private String name;
  private String src;
  private List<String> css;
}
