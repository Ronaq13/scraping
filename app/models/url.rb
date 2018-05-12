class Url < ApplicationRecord
  include Parser

  has_many :h_one, dependent: :destroy
  has_many :h_two, dependent: :destroy
  has_many :h_three, dependent: :destroy

  def parse_and_build_content
    # Parsing
    h1_list = parse_from_link link, 'h1'
    h2_list = parse_from_link link, 'h2'
    h3_list = parse_from_link link, 'h3'

    # Building Content
    h1_list.each { |content| h_one.build(content: content) }
    h2_list.each { |content| h_two.build(content: content) }
    h3_list.each { |content| h_three.build(content: content) }
  end
end
