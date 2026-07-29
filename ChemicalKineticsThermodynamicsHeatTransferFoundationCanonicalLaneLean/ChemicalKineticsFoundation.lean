import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure KineticsFoundation where
  reactionMechanism : ReactionMechanism
  equilibrium : EquilibriumState
  heatModel : HeatTransferModel
  coupledSystem : Prop

def kineticsFoundationClosed (k : KineticsFoundation) : Prop :=
  standardReactionRate k.reactionMechanism ∧ equilibriumCondition k.equilibrium ∧
  heatEquationClosed k.heatModel ∧ k.coupledSystem

structure KineticsFoundationEvidence where
  foundation : KineticsFoundation
  rateEvidence : ReactionRateEvidence
  equilibriumEvidence : EquilibriumEvidence
  heatEvidence : HeatTransferEvidence
  coupledClosed : foundation.coupledSystem

theorem kinetics_foundation_closed_from_evidence (k : KineticsFoundation) (e : KineticsFoundationEvidence) :
  kineticsFoundationClosed k := by
  refine And.intro (reaction_rate_closed_from_evidence k.reactionMechanism e.rateEvidence) ?_
  refine And.intro (equilibrium_closed_from_evidence k.equilibrium e.equilibriumEvidence) ?_
  refine And.intro (heat_transfer_closed_from_evidence k.heatModel e.heatEvidence) e.coupledClosed

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse