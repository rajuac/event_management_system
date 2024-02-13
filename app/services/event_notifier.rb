
class EventNotifier
  attr_reader :params

  def initialize(params)
    @params = params
    @user_id = params[:user_id]
  end

  def call
    send_email_notification
  end

  private

  def send_email_notification
    base_uri 'https://api.iterable.com'
    headers 'Api-Key' => IterableApi.api_key

    def self.send_email_notification
      body = {
        "campaignId": 0,
        "recipientEmail": 'acvipinraj88@gmail.com',
        "recipientUserId": @user_id,
        "dataFields": {},
        "sendAt": 'string',
        "allowRepeatMarketingSends": true,
        "metadata": {}
      }
      response = post('/api/email/target', body:)
      handle_response(response)
    end

    private

    def self.handle_response(response)
      # Handle the response from Iterable as needed
      unless response.success?
        # Handle error response
      end
      JSON.parse(response.body)
    end
  end
end
