package jp.focus.line.calm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

/** Spring Security. */
@Configuration
public class SecurityConfig {
  @Bean
  SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.formLogin(
            login ->
                login // フォーム認証を使う
                    // フォーム認証画面は認証不要
                    .permitAll())
        .authorizeHttpRequests(
            authz ->
                authz
                    // CSSファイルは認証不要
                    .requestMatchers("/css/**")
                    .permitAll()
                    // トップページは認証不要
                    .requestMatchers("/**")
                    .permitAll()
                    // 他のURLはログイン後アクセス可能
                    .anyRequest()
                    .authenticated());

    return http.build();
  }
}
