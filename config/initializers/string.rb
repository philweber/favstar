class String
  def numeric?
    !!self.match(/\A[0-9]+\Z/)
  end
end
