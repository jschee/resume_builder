Grover.configure do |config|
  config.options = {
    margin: {
      top: '15px',
      right: '5px',
      bottom: '25px',
      left: '5px'
    },
    print_background: true,
    user_agent: 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0',
    full_page: false,
    prefer_css_page_size: false,
    bypass_csp: true,
    emulate_media: 'screen',
    media_features: [{ name: 'prefers-color-scheme', value: 'dark' }],
    cache: false,
    timeout: 0, # Timeout in ms. A value of `0` means 'no timeout'
    # request_timeout: 1000, # Timeout when fetching the content (overloads the `timeout` option)
    # convert_timeout: 2000, # Timeout when converting the content (overloads the `timeout` option, only applies to PDF conversion)
    launch_args: ['--font-render-hinting=medium'],
    wait_until: 'domcontentloaded'
  }
end
