# == Schema Information
#
# Table name: apiv1_translations
#
#  id              :integer          not null, primary key
#  locale          :string(255)      not null
#  key             :string(255)      not null
#  translated_text :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Apiv1::Translation < ActiveRecord::Base
  Languages = YAML.load(File.read Rails.root.join "config", "desired_languages.yml")["languages"]
  KnownLocales = Languages.keys
  include ::Elasticsearch::Model
  include ::Elasticsearch::Model::Callbacks
  class << self
    def known_languages
      select(:locale).uniq.map(&:locale)
    end
  end
  scope :order_alphabetically,
    -> { order "#{self.table_name}.key asc" }

  scope :by_locale,
    -> (l) { where locale: l }

  scope :by_key,
    -> (k) { where key: k }

  after_create :_add_to_i18n_backend

  validates :locale,
    :key,
    :translated_text,
    presence: true

  validates :locale,
    inclusion: { in: KnownLocales }

  def to_ember_hash
    { id: id, locale: locale, key: key, translated_text: translated_text }
  end

  def as_indexed_json(options={})
    {
      key: key.to_s,
      enkey: key.to_s.split("_").join(" "),
      translated_text: translated_text
    }
  end
  private
  def _add_to_i18n_backend
    I18n.backend.store_translations locale, key => translated_text
  end
end
