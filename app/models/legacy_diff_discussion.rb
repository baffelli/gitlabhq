# A discussion on merge request or commit diffs consisting of `LegacyDiffNote` notes.
#
# All new diff discussions are of the type `DiffDiscussion`, but any diff discussions created
# before the introduction of the new implementation still use `LegacyDiffDiscussion`.
#
# A discussion of this type is never resolvable.
class LegacyDiffDiscussion < Discussion
  include DiscussionOnDiff

  def legacy_diff_discussion?
    true
  end

  def self.note_class
    LegacyDiffNote
  end

  def collapsed?
    !active?
  end

  def reply_attributes
    super.merge(line_code: line_code)
  end
end
