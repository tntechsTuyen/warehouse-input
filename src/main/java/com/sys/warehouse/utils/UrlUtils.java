package com.sys.warehouse.utils;

import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Optional;


public class UrlUtils {

	/**
	 * Returns the viewName to return for coming back to the sender url
	 *
	 * @param request Instance of {@link HttpServletRequest} or use an injected instance
	 * @return Optional with the view name. Recomended to use an alternativa url with
	 * {@link Optional#orElse(Object)}
	 */
	public static Optional<String> getPreviousPageByRequest(HttpServletRequest request)
	{
		return Optional.ofNullable(request.getHeader("Referer")).map(requestUrl -> "redirect:" + requestUrl);
	}
}
