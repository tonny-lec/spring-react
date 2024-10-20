package jp.focus.line.calm.config;

import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FileOptions {
    private String file;
    private String name;
    private String src;
    private List<String> css;
}
