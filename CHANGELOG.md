## 0.0.3 (2013-07-29)

- Bug fix:
    - Automatically add Content-Length (`use Rack::ContentLength`)
    - Automatically add Transfer-Encoding and be chunked (`use Rack::Chunked`)

## 0.0.2 (2013-07-27)

- New syntax:
    - `extend` config.ru, use `run_pow` for rack app especially called by `foreman`.
    
## 0.0.1 (2013-07-13)

- First release