class SubjectTree
  def initialize(subject)
    @subject = subject
  end

  def children(options = {})
    if options[:deep]
      walk_children(@subject).flatten
    else
      @subject.children
    end
  end

  def parents(options = {})
    if options[:deep]
      walk_parents(@subject).flatten
    else
      @subject.parents
    end
  end

  private
  def walk_parents(start, parents = [])
    start.parents.map do |p|
      walk_parents(p, parents) unless p.parents.empty?
    end
    parents << start.parents
  end

  def walk_children(start, children = [])
    start.children.each do |c|
      walk_children(c, children) unless c.children.empty?
    end 
    children << start.children
  end
end
