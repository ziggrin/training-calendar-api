# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "http://localhost",
                "http://127.0.0.1",
                "http://localhost:3000",
                "https://app.omega-next.online",
                /\Ahttps:\/\/deploy-preview-\d{1,4}--yourwebsite\.domain\.app\z/

        resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        # credentials: true,
        max_age: 86400
    end
end
