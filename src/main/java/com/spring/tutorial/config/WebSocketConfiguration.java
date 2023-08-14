package com.spring.tutorial.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

//웹소켓에 대한 Configuration 클래스
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfiguration implements WebSocketMessageBrokerConfigurer {

	// 스프링에서 웹소켓을 사용하기 위해서 클라이언트가 보내는 통신을 처리할 핸들러
  @Override
  public void configureMessageBroker(MessageBrokerRegistry config) {
	// 해당 경로를 SUBSCRIBE하는 Client에게 메세지를 전달하는 간단한 작업을 수행
    config.enableSimpleBroker("/sub");
    
    // 이 경로로 시작하는 STOMP 메세지의 destination 헤더는 컨트롤러의 메세지매핑으로 라우팅
    config.setApplicationDestinationPrefixes("/pub");
  }

  @Override
  public void registerStompEndpoints(StompEndpointRegistry registry) {
	// addEndpoint : 웹소켓 핸드셰이크 커넥션을 생성할 경로
    registry.addEndpoint("/stomp")
    		.setAllowedOrigins("*")
    		.withSockJS();
    // setAllowedOrigins("http://localhost:8080")
    
  }

}
