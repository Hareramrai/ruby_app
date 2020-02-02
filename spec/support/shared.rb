shared_context 'log grouped by end point' do
  let(:log_grouped_by_end_point) do
    {
      '/help_page/1' => [
        Server::WebRequest.new('/help_page/1', '126.318.035.038'),
        Server::WebRequest.new('/help_page/1', '929.398.951.889'),
        Server::WebRequest.new('/help_page/1', '929.398.951.889')
      ],
      '/contact' => [
        Server::WebRequest.new('/contact', '184.123.665.067')
      ],
      '/home' => [
        Server::WebRequest.new('/home', '184.123.665.067')
      ],
      '/about/2' => [
        Server::WebRequest.new('/about/2', '444.701.448.104')
      ]
    }
  end
end

def get_result_from_queue(report_queue)
  result = []
  report_queue.pop_each { |report| result << report }
  result
end
