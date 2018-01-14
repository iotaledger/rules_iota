/***
* Copyright (C) Microsoft. All rights reserved.
* Licensed under the MIT license. 
* See https://raw.githubusercontent.com/Microsoft/cpprestsdk/master/license.txt
*
* =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
*
* bingrequest.cpp - Simple cmd line application that makes an HTTP GET request to bing searching and outputting
*       the resulting HTML response body into a file.
*
* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
****/

#include <cpprest/http_client.h>
#include <cpprest/filestream.h>

using namespace utility;
using namespace web::http;
using namespace web::http::client;
using namespace concurrency::streams;

/* Can pass proxy information via environment variable http_proxy.
   Example:
   Linux:   export http_proxy=http://192.1.8.1:8080
 */
web::http::client::http_client_config client_config_for_proxy()
{
    web::http::client::http_client_config client_config;
#ifdef _WIN32
    wchar_t* pValue = nullptr;
    std::unique_ptr<wchar_t, void(*)(wchar_t*)> holder(nullptr, [](wchar_t* p) { free(p); });
    size_t len = 0;
    auto err = _wdupenv_s(&pValue, &len, L"http_proxy");
    if (pValue)
        holder.reset(pValue);
    if (!err && pValue && len) {
        std::wstring env_http_proxy_string(pValue, len - 1);
#else
    if(const char* env_http_proxy = std::getenv("http_proxy")) {
        std::string env_http_proxy_string(env_http_proxy);
#endif
        if (env_http_proxy_string == U("auto"))
            client_config.set_proxy(web::web_proxy::use_auto_discovery);
        else
            client_config.set_proxy(web::web_proxy(env_http_proxy_string));
    }

    return client_config;
}


#ifdef _WIN32
int wmain(int argc, wchar_t *args[])
#else
int main(int argc, char *args[])
#endif
{
    const string_t searchTerm = "foo";

    http_client client(U("http://www.bing.com/"), client_config_for_proxy());
    client.request(methods::GET, uri_builder(U("/search")).append_query(U("q"), searchTerm).to_string())

    // Write the response body into the file buffer.
    .then([=](http_response response) -> int
    {
        printf("Response status code %u returned.\n", response.status_code());
	return 0;
    });


    return 0;
}
