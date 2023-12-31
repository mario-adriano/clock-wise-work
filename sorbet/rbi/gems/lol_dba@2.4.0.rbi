# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `lol_dba` gem.
# Please instead update this file by running `bin/tapioca gem lol_dba`.

# source://lol_dba//lib/lol_dba.rb#1
module LolDba; end

# source://lol_dba//lib/lol_dba/index_finding/belongs_to.rb#2
class LolDba::BelongsTo < ::LolDba::RelationInspector
  # source://lol_dba//lib/lol_dba/index_finding/belongs_to.rb#3
  def relation_columns; end

  # source://lol_dba//lib/lol_dba/index_finding/belongs_to.rb#17
  def table_name; end

  private

  # source://lol_dba//lib/lol_dba/index_finding/belongs_to.rb#23
  def non_polymorphic_fk; end
end

# source://lol_dba//lib/lol_dba/index_finding/error_logging.rb#2
class LolDba::ErrorLogging
  class << self
    # source://lol_dba//lib/lol_dba/index_finding/error_logging.rb#3
    def log(model_class, reflection_options, exception); end
  end
end

# source://lol_dba//lib/lol_dba/index_finding/has_and_belongs_to_many.rb#2
class LolDba::HasAndBelongsToMany < ::LolDba::RelationInspector
  # source://lol_dba//lib/lol_dba/index_finding/has_and_belongs_to_many.rb#3
  def relation_columns; end

  # source://lol_dba//lib/lol_dba/index_finding/has_and_belongs_to_many.rb#8
  def table_name; end

  private

  # source://lol_dba//lib/lol_dba/index_finding/has_and_belongs_to_many.rb#15
  def association_fk; end
end

# source://lol_dba//lib/lol_dba/index_finding/has_many.rb#2
class LolDba::HasMany < ::LolDba::RelationInspector
  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#3
  def relation_columns; end

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#14
  def table_name; end

  private

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#20
  def find_association_fk; end

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#39
  def foreign_key; end

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#35
  def through; end

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#31
  def through_class; end

  # source://lol_dba//lib/lol_dba/index_finding/has_many.rb#43
  def through_reflections; end
end

# source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#2
class LolDba::IndexFinder
  class << self
    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#9
    def check_for_indexes; end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#79
    def eager_load_if_needed; end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#54
    def existing_indexes(table_name); end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#40
    def missing_indexes(indexes_required); end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#69
    def model_classes; end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#65
    def primary_key(table_name); end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#3
    def run; end

    # @return [Boolean]
    #
    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#75
    def session_store?(obj); end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#58
    def table_indexes(table_name); end

    # source://lol_dba//lib/lol_dba/index_finding/index_finder.rb#50
    def tables; end
  end
end

# source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#2
class LolDba::Migration
  # @return [Migration] a new instance of Migration
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#5
  def initialize(migration_file); end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#41
  def connection; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#34
  def down; end

  # Returns the value of attribute full_name.
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#3
  def full_name; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#45
  def generate_instead_of_executing; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#23
  def migration_class; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#15
  def name; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#11
  def number; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#19
  def to_s; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#27
  def up; end

  # Returns the value of attribute writer.
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/migration.rb#3
  def writer; end
end

# source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#2
class LolDba::MigrationFormatter
  # @return [MigrationFormatter] a new instance of MigrationFormatter
  #
  # source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#3
  def initialize(indexes); end

  # source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#16
  def format_for_migration(missing_indexes); end

  # source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#27
  def format_index(table_name, key); end

  # source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#36
  def migration_instructions(formated_indexes); end

  # source://lol_dba//lib/lol_dba/index_finding/migration_formatter.rb#7
  def puts_migration_content; end
end

# source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#2
class LolDba::MigrationMocker
  # @return [MigrationMocker] a new instance of MigrationMocker
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#3
  def initialize(writer); end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#35
  def methods_to_modify; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#31
  def redefine_connection_method(method, &block); end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#7
  def redefine_migration_methods; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#15
  def reset_methods; end

  private

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#59
  def redefine_execute_methods(name); end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#48
  def redefine_metadata_methods; end

  # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#41
  def save_original_methods; end

  class << self
    # source://lol_dba//lib/lol_dba/sql_migrations/migration_mocker.rb#27
    def connection; end
  end
end

# source://lol_dba//lib/lol_dba/rails_compatibility.rb#2
class LolDba::RailsCompatibility
  class << self
    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#4
    def migrator; end

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#12
    def tables; end

    private

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#43
    def ar_4_migrations_path; end

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#39
    def ar_5_2_migrations_path; end

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#35
    def ar_6_migrations_path; end

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#22
    def migrations_path; end

    # source://lol_dba//lib/lol_dba/rails_compatibility.rb#47
    def path; end
  end
end

# source://lol_dba//lib/lol_dba/railtie.rb#5
class LolDba::Railtie < ::Rails::Railtie; end

# source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#2
class LolDba::RelationInspector
  # @return [RelationInspector] a new instance of RelationInspector
  #
  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#5
  def initialize(model_class, reflection_options, reflection_name); end

  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#11
  def get_through_foreign_key(target_class, reflection_options); end

  # Returns the value of attribute model_class.
  #
  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#3
  def model_class; end

  # Returns the value of attribute reflection_name.
  #
  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#3
  def reflection_name; end

  # Returns the value of attribute reflection_options.
  #
  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#3
  def reflection_options; end

  # source://lol_dba//lib/lol_dba/index_finding/relation_inspector.rb#26
  def reflections; end
end

# source://lol_dba//lib/lol_dba/index_finding/relation_inspector_factory.rb#2
class LolDba::RelationInspectorFactory
  class << self
    # source://lol_dba//lib/lol_dba/index_finding/relation_inspector_factory.rb#9
    def for(type); end
  end
end

# source://lol_dba//lib/lol_dba/index_finding/relation_inspector_factory.rb#3
LolDba::RelationInspectorFactory::TYPES = T.let(T.unsafe(nil), Hash)

# source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#2
class LolDba::SqlGenerator
  # @return [SqlGenerator] a new instance of SqlGenerator
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#3
  def initialize(which); end

  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#7
  def run; end

  private

  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#16
  def migrations(which); end

  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#45
  def migrator; end

  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#26
  def pending_migrations; end

  # source://lol_dba//lib/lol_dba/sql_migrations/sql_generator.rb#35
  def specific_migration(which); end
end

# source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#2
class LolDba::Writer
  # @return [Writer] a new instance of Writer
  #
  # source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#3
  def initialize(file_name); end

  # source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#12
  def write(string); end

  private

  # source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#28
  def path; end

  class << self
    # source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#22
    def output_dir; end

    # source://lol_dba//lib/lol_dba/sql_migrations/writer.rb#7
    def reset_output_dir; end
  end
end
